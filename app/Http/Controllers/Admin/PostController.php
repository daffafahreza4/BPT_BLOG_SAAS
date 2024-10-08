<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\PostRequest;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use App\Models\Membership;
use App\Traits\SlugCreater;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    use SlugCreater;

    public function __construct()
    {
        $this->authorizeResource(Post::class, 'post');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::with(['category:id,name', 'user:id,name', 'tags:id,name'])->latest()->paginate(15);

        return view('admin.post.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        $memberships = Membership::all();
        return view('admin.post.create', compact('categories', 'tags', 'memberships'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PostRequest $request)
    {
        $post_data = $request->safe()->except('image');

        if ($request->hasfile('image')) {
            $get_file = $request->file('image')->store('public/images/posts');
            $post_data['image'] = str_replace('public/', '', $get_file);
        }

        $post = Post::create($post_data);

        if ($request->has('tags')) {
            $post->tags()->attach($request->tags);
        }

        return to_route('admin.post.index')->with('message', trans('admin.post_created'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $categories = Category::all();
        $tags = Tag::all();
        $memberships = Membership::all();

        return view('admin.post.edit', compact('post', 'categories', 'tags', 'memberships'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PostRequest $request, Post $post)
    {
        $post_data = $request->safe()->except('image');

        if ($request->hasfile('image')) {
            Storage::delete($post->image);
            $get_file = $request->file('image')->store('public/images/posts');
            $post_data['image'] = str_replace('public/', '', $get_file);
        }

        $post->update($post_data);
        $post->tags()->sync($request->tags);

        return to_route('admin.post.index')->with('message', trans('admin.post_updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        if ($post->image != null) {
            Storage::delete($post->image);
        }
        $post->delete();

        return back()->with('message', trans('admin.post_deleted'));
    }

    public function getSlug(Request $request)
    {
        $slug = $this->createSlug($request, Post::class);

        return response()->json(['slug' => $slug]);
    }

    public function search(Request $request)
    {
        $searched_text = $request->input('search');

        $posts = Post::query()->with(['category', 'user', 'tags'])
            ->where('title', 'LIKE', "%{$searched_text}%")
            ->orWhere('content', 'LIKE', "%{$searched_text}%")
            ->paginate(10);

        // Return the search view with the resluts
        return view('admin.post.search', compact('posts'));
    }
}
