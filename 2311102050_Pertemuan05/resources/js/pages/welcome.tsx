import { Head, Link, usePage } from '@inertiajs/react';
import { dashboard, login, register } from '@/routes';

export default function Welcome({
    canRegister = true,
}: {
    canRegister?: boolean;
}) {
    const { auth } = usePage().props;

    return (
        <>
            <Head title="Selamat Datang">
                <link rel="preconnect" href="https://fonts.bunny.net" />
                <link
                    href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600"
                    rel="stylesheet"
                />
            </Head>
            <div className="flex min-h-screen flex-col items-center justify-center bg-[#FDFDFC] p-6 text-[#1b1b18] dark:bg-[#0a0a0a] dark:text-[#EDEDEC]">
                <header className="absolute top-0 right-0 p-6">
                    <nav className="flex items-center gap-4">
                        {auth.user ? (
                            <Link
                                href={dashboard()}
                                className="inline-block rounded-sm border border-[#19140035] px-5 py-1.5 text-sm font-medium hover:border-[#1915014a] dark:border-[#3E3E3A] dark:hover:border-[#62605b]"
                            >
                                Dashboard
                            </Link>
                        ) : (
                            <>
                                <Link
                                    href={login()}
                                    className="inline-block px-5 py-1.5 text-sm font-medium hover:underline"
                                >
                                    Log in
                                </Link>
                                {canRegister && (
                                    <Link
                                        href={register()}
                                        className="inline-block rounded-sm border border-[#19140035] px-5 py-1.5 text-sm font-medium hover:border-[#1915014a] dark:border-[#3E3E3A] dark:hover:border-[#62605b]"
                                    >
                                        Register
                                    </Link>
                                )}
                            </>
                        )}
                    </nav>
                </header>
                
                <main className="text-center">
                    <h1 className="mb-4 text-4xl font-bold lg:text-6xl">
                        Selamat Datang di Warung Mas Wowo
                    </h1>
                    <p className="mb-8 text-lg text-[#706f6c] dark:text-[#A1A09A]">
                        Solusi kebutuhan harian Anda hanya di Toko Mas Wowo.
                    </p>
                    <div className="flex justify-center gap-4">
                        <Link
                            href={dashboard()}
                            className="inline-block rounded-md bg-[#1b1b18] px-8 py-3 text-sm font-medium text-white hover:bg-black dark:bg-[#eeeeec] dark:text-[#1C1C1A] dark:hover:bg-white"
                        >
                            Mulai Belanja
                        </Link>
                    </div>
                </main>

                <footer className="absolute bottom-0 w-full py-6 text-center text-sm text-[#706f6c] dark:text-[#A1A09A]">
                    &copy; {new Date().getFullYear()} Toko Mas Wowo. All rights reserved.
                </footer>
            </div>
        </>
    );
}
