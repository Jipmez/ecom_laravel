<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\ProductTag;
use App\Models\Tag;
use Illuminate\Http\Request;

class ShopsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $categories = Category::all();
        $tags = Tag::all();
        $products = Product::all();
        return view('layouts/home/shop')->with([
            'products' => $products,
            'categories' => $categories,
            'tags' => $tags,
            /* 'categoryName' => $categoryName ?? null,
        'tagName' => $tagName ?? null, */
        ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createIn()
    {
        //
        $categories = Category::all();
        return view('dashboard/dash/create')->with([
            'cat' => $categories,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        request()->validate([
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',

        ]);
        $imageName = time() . '.' . request()->image->extension();
        request()->image->move(public_path('images/products/dummy'), $imageName);
        $cat = Category::where('id', request()->cat)->get()->first();

        $products = Product::create([
            'name' => request()->title,
            'slug' => $cat->slug . "-" . $this->randomDigits(4),
            'details' => request()->details,
            'price' => request()->price,
            'image' => 'products/dummy' . "/" . $imageName,
            'featured' => 0,
            'category_id' => $cat->id,
            'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam, veniam?', //request()->content,
        ]);

        $tag = ProductTag::create([
            'product_id' => $products->id,
            'tag_id' => 2,
        ]);
        return redirect()->route('create.index')->with('success', 'Product inserted');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //create post
    }

    public function show($shop)
    {
        $product = Product::where('slug', $shop)->firstOrFail();
        $images = json_decode($product->images);
        $mightLike = Product::where('slug', '!=', $product->slug)->mightAlsoLike()->get();
        $stockLevel = getStockLevel($product->quantity);
        return view('layouts/home/product')->with([
            'product' => $product,
            'mightLike' => $mightLike,
            'images' => $images,
            'stockLevel' => $stockLevel,
        ]);
    }

    public function edit($id)
    {
        $data = Product::findOrFail($id);
        $data->name = request()->title;
        $data->price = request()->price;
        $data->featured = 0;
        $data->details = request()->details;
        $data->save();
        return redirect()->route('edit.index', $id)->with('success', 'Edited');
    }

    public function editIn($id)
    {
        $product = Product::where('id', $id)->get()->first();
        $categories = Category::all();
        return view('dashboard/dash/edit')->with([
            'product' => $product,
            'cat' => $categories,
        ]);
    }

    public function update()
    {
        //
    }

    public function destroy($id)
    {
        $model = Product::find($id);
        $model->delete();
        unlink(public_path('images/products/dummy') . "/" . explode('/', $model->image)[2]);
        return redirect()->route('home')->with('success', 'Product Deleted');
    }

    private function randomDigits($numDigits)
    {
        if ($numDigits <= 0) {
            return '';
        }

        return mt_rand(0, 9) . $this->randomDigits($numDigits - 1);
    }
}
