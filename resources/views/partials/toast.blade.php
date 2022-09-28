@if (session()->has('success'))
    <div class="alert alert-success" id="alert">
        <h2>{{ session()->get('success') }}</h2>
        <div id="close" class="btn btn-close">X</div>
    </div>
@endif

@if (session()->has('error'))
    <div class="alert alert-danger" id="alert">
        <h2>{{ session()->get('error') }}</h2>
        <div id="close" class="btn btn-close">X</div>
    </div>
@endif



@section('scripts')
    <script type="text/javascript">
        function close() {
            document.getElementById("alert").classList.add("esconder");
        }
        document.getElementById("close").onclick = function() {
            close();
        };
    </script>
@endsection
