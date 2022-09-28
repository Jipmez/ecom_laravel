@extends('dashboard.app')
@section('content')
    <section class="section">

        <div class="section-body">
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>All Products</h4>
                        </div>
                        <div class="card-body">

                            <div class="clearfix mb-3"></div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Product id</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Image</th>
                                    </tr>
                                    @foreach ($products as $item)
                                        <tr>
                                            <td>
                                                <span class="d-inline-block ml-1">{{ $item->id }}</span>
                                            </td>
                                            <td>{{ $item->name }}
                                                <div class="table-links">
                                                    <a href="{{ route('shop.show', $item->slug) }}">View</a>
                                                    <div class="bullet"></div>
                                                    <a href="{{ route('shop.edit', $item->id) }}">Edit</a>
                                                    <div class="bullet"></div>
                                                    <form action="{{ route('shop.delete', $item->id) }}" method="POST"
                                                        class="d-inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="text-danger"
                                                            style="background: transparent !important; border: none !important;">Trash</button>
                                                    </form>

                                                </div>
                                            </td>
                                            <td>
                                                <span>{{ $item->slug }}</span>
                                            </td>
                                            <td><img src="{{ productImage($item->image) }}" alt=""
                                                    style="width: 30%; height: 30%;"></td>
                                            {{--   <td>
                                                <form action="/user/dashboard/index/feat/<%= post[i].id %>" method="POST"
                                                    class="d-inline">
                                                    <button type="submit" class="badge btn-success">Make
                                                        featured </button>
                                                    <button type="submit" class="badge btn-danger">Remove
                                                        featured </button>

                                                </form>
                                            </td> --}}
                                        </tr>
                                    @endforeach

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
