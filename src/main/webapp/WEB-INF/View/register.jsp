<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="images/favicon.ico" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        laravel: "#2541e2",
                    },
                },
            },
        };
    </script>
    <title>Register to Our Watchapix</title>
</head>
<body class="mb-48">
<nav class="flex justify-between items-center mb-4">
    <a href="index.html"
    ><img class="w-24" src="images/logo.png" alt="" class="logo"
    /></a>
    <ul class="flex space-x-6 mr-6 text-lg">
        <li>
            <a href="<c:url value="/register"/>" class="hover:text-laravel"
            ><i class="fa-solid fa-user-plus"></i> Register</a
            >
        </li>
        <li>
            <a href="<c:url value="/login"/>" class="hover:text-laravel"
            ><i class="fa-solid fa-arrow-right-to-bracket"></i>
                Login</a
            >
        </li>
    </ul>
</nav>

<main>
    <div class="mx-4">
        <div
                class="bg-gray-50 border border-gray-200 p-10 rounded max-w-lg mx-auto mt-24"
        >
            <header class="text-center">
                <h2 class="text-2xl font-bold uppercase mb-1">
                    Register
                </h2>
                <p class="mb-4">Create an account to start watchapixing</p>
            </header>
            <p class="text-red-500 text-xs mt-1">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </p>
            <form action="/register" method="post" enctype="multipart/form-data">
                <div class="mb-6">
                    <label class="inline-block text-lg mb-2">
                        Name
                    </label>
                    <input
                            type="text"
                            class="border border-gray-200 rounded p-2 w-full"
                            name="name"
                    />
                </div>
                <div class="mb-6">
                    <label class="inline-block text-lg mb-2">
                        your image
                    </label>
                    <input
                            type="file"
                            class="border border-gray-200 rounded p-2 w-full"
                            name="logo"
                            value=""
                    />
                </div>
                <div class="mb-6">
                    <div class="inline-block text-lg mb-2 mr-4">
                        <input type="radio" class="border border-gray-200 rounded p-2 mr-2" name="sex"  value="M" checked/>
                        <label>Man</label>
                    </div>
                    <div class="inline-block text-lg mb-2 float-right">
                        <label>Women</label>
                        <input type="radio" class="border border-gray-200 rounded p-2 mr-2" name="sex" value="F"/>
                    </div>
                </div>
                <div class="mb-6">
                    <label class="inline-block text-lg mb-2"
                    >Email</label
                    >
                    <input
                            type="email"
                            class="border border-gray-200 rounded p-2 w-full"
                            name="email"
                    />

                </div>

                <div class="mb-6">
                    <label
                            class="inline-block text-lg mb-2"
                    >
                        Password
                    </label>
                    <input
                            type="password"
                            class="border border-gray-200 rounded p-2 w-full"
                            name="password"
                    />
                </div>

                <div class="mb-6">
                    <label
                            class="inline-block text-lg mb-2"
                    >
                        Confirm Password
                    </label>
                    <input
                            type="password"
                            class="border border-gray-200 rounded p-2 w-full"
                            name="password2"
                    />
                </div>

                <div class="mb-6">
                    <button
                            type="submit"
                            class="bg-laravel text-white rounded py-2 px-4 hover:bg-black"
                    >
                        Sign Up
                    </button>
                </div>

                <div class="mt-8">
                    <p>
                        Already have an account?
                        <a href="<c:url value="/login"/>" class="text-laravel"
                        >Login</a
                        >
                    </p>
                </div>
            </form>
        </div>
    </div>
</main>


</body>
</html>
























<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8" />--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge" />--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
<%--    <link rel="icon" href="images/favicon.ico" />--%>
<%--    <link--%>
<%--            rel="stylesheet"--%>
<%--            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"--%>
<%--            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="--%>
<%--            crossorigin="anonymous"--%>
<%--            referrerpolicy="no-referrer"--%>
<%--    />--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--    <script>--%>
<%--        tailwind.config = {--%>
<%--            theme: {--%>
<%--                extend: {--%>
<%--                    colors: {--%>
<%--                        laravel: "#2541e2",--%>
<%--                    },--%>
<%--                },--%>
<%--            },--%>
<%--        };--%>
<%--    </script>--%>
<%--    <title>Register to Our Watchapix</title>--%>
<%--</head>--%>
<%--<body class="mb-48">--%>
<%--<nav class="flex justify-between items-center mb-4">--%>
<%--    <a href="index.html"--%>
<%--    ><img class="w-24" src="images/logo.png" alt="" class="logo"--%>
<%--    /></a>--%>
<%--    <ul class="flex space-x-6 mr-6 text-lg">--%>
<%--        <li>--%>
<%--            <a href="register.html" class="hover:text-laravel"--%>
<%--            ><i class="fa-solid fa-user-plus"></i> Register</a--%>
<%--            >--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="login.html" class="hover:text-laravel"--%>
<%--            ><i class="fa-solid fa-arrow-right-to-bracket"></i>--%>
<%--                Login</a--%>
<%--            >--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</nav>--%>

<%--<main>--%>
<%--    <div class="mx-4">--%>
<%--        <div--%>
<%--                class="bg-gray-50 border border-gray-200 p-10 rounded max-w-lg mx-auto mt-24"--%>
<%--        >--%>
<%--            <header class="text-center">--%>
<%--                <h2 class="text-2xl font-bold uppercase mb-1">--%>
<%--                    Register--%>
<%--                </h2>--%>
<%--                <p class="mb-4">Create an account to start watchapixing</p>--%>
<%--            </header>--%>
<%--                <p style="color: red"> <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>--%>
<%--                </p>--%>
<%--            <form action="/signup" enctype="multipart/form-data" method="POST">--%>
<%--                <div class="mb-6">--%>
<%--                    <label class="inline-block text-lg mb-2">--%>
<%--                        Name--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="text"--%>
<%--                            class="border border-gray-200 rounded p-2 w-full"--%>
<%--                            name="name"--%>
<%--                    />--%>
<%--                </div>--%>
<%--                <div class="mb-6">--%>
<%--                    <label class="inline-block text-lg mb-2">--%>
<%--                        your image--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="file"--%>
<%--                            class="border border-gray-200 rounded p-2 w-full"--%>
<%--                            name="logo"--%>
<%--                            value=""--%>
<%--                    />--%>
<%--                </div>--%>
<%--                <div class="mb-6">--%>
<%--                    <div class="inline-block text-lg mb-2 mr-4">--%>
<%--                        <input type="radio" class="border border-gray-200 rounded p-2 mr-2" name="sex"  value="M" checked/>--%>
<%--                        <label>Man</label>--%>
<%--                    </div>--%>
<%--                 <div class="inline-block text-lg mb-2 float-right">--%>
<%--                            <label>Women</label>--%>
<%--                     <input type="radio" class="border border-gray-200 rounded p-2 mr-2" name="sex" value="F"/>--%>
<%--                 </div>--%>
<%--                </div>--%>
<%--                <div class="mb-6">--%>
<%--                    <label class="inline-block text-lg mb-2"--%>
<%--                    >Email</label--%>
<%--                    >--%>
<%--                    <input--%>
<%--                            type="email"--%>
<%--                            class="border border-gray-200 rounded p-2 w-full"--%>
<%--                            name="email"--%>
<%--                    />--%>
<%--                    <!-- Error Example -->--%>
<%--                    <p class="text-red-500 text-xs mt-1">--%>
<%--                        Please enter a valid email--%>
<%--                    </p>--%>
<%--                </div>--%>

<%--                <div class="mb-6">--%>
<%--                    <label--%>
<%--                            class="inline-block text-lg mb-2"--%>
<%--                    >--%>
<%--                        Password--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="password"--%>
<%--                            class="border border-gray-200 rounded p-2 w-full"--%>
<%--                            name="password"--%>
<%--                    />--%>
<%--                </div>--%>

<%--                <div class="mb-6">--%>
<%--                    <label--%>
<%--                            class="inline-block text-lg mb-2"--%>
<%--                    >--%>
<%--                        Confirm Password--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="password"--%>
<%--                            class="border border-gray-200 rounded p-2 w-full"--%>
<%--                            name="password2"--%>
<%--                    />--%>
<%--                </div>--%>

<%--                <div class="mb-6">--%>
<%--                    <button--%>
<%--                            type="submit"--%>
<%--                            class="bg-laravel text-white rounded py-2 px-4 hover:bg-black"--%>
<%--                    >--%>
<%--                        Sign Up--%>
<%--                    </button>--%>
<%--                </div>--%>

<%--                <div class="mt-8">--%>
<%--                    <p>--%>
<%--                        Already have an account?--%>
<%--                        <a href="login.html" class="text-laravel"--%>
<%--                        >Login</a--%>
<%--                        >--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>


<%--</body>--%>
<%--</html>--%>
