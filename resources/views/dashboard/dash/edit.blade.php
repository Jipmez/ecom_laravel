@extends('dashboard.app')
@section('content')
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Edit your Product</h4>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('shop.edit', $product->id) }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Title</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="title" value="{{ $product->name }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Category</label>
                                    <div class="col-sm-12 col-md-7">
                                        <select class="form-control selectric" name="cat">
                                            <option value="{{ $product->category_id }}" selected disabled>
                                                {{ $product->category_id }}</option>
                                            @foreach ($cat as $cat)
                                                <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Details</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="details" value="{{ $product->details }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Content</label>
                                    <div class="col-sm-12 col-md-7">
                                        <textarea class="ckeditor" name="content"> {{ $product->description }}</textarea>
                                    </div>

                                </div>
                                <div class="form-group
                                            row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Price</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" name="price" value="{{ $product->price }}"
                                            class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Thumbnail</label>
                                    <div class="col-sm-12 col-md-7">
                                        <div id="image-preview" class="image-preview">
                                            <label for="image-upload" id="image-label">Choose
                                                File</label>
                                            <input type="file" name="image" id="image-upload" />
                                        </div>

                                        <div>
                                            <img src="{{ productImage($product->image) }}" style="height: 30%; width: 30%;"
                                                alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary">Create Post</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('ck')
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
@endsection

@section('scripts')
    <script>
        CKEDITOR.replace('content', {
            height: 300,
            filebrowserUploadUrl: "/user/dashboard/upload"
        });

        function close() {
            document.getElementById("alert").classList.add("esconder");
        }
        document.getElementById("close").onclick = function() {
            close();
        };
        setTimeout(() => {
            close()
        }, 3000);
    </script>
@endsection
