import { Head } from '@inertiajs/react';
import { dashboard } from '@/routes';

interface DashboardProps {
    stats: {
        total_products: number;
        total_stock: number;
        total_value: number;
    };
}

export default function Dashboard({ stats }: DashboardProps) {
    const formatCurrency = (value: number) => {
        return new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
            minimumFractionDigits: 0,
        }).format(value);
    };

    return (
        <>
            <Head title="Dashboard" />
            <div className="flex h-full flex-1 flex-col gap-4 p-4">
                <div className="grid gap-4 md:grid-cols-3">
                    <div className="rounded-xl border border-sidebar-border/70 p-6 shadow-sm dark:border-sidebar-border">
                        <div className="text-sm font-medium text-muted-foreground">Total Produk</div>
                        <div className="mt-2 text-3xl font-bold">{stats.total_products}</div>
                    </div>
                    <div className="rounded-xl border border-sidebar-border/70 p-6 shadow-sm dark:border-sidebar-border">
                        <div className="text-sm font-medium text-muted-foreground">Total Stok</div>
                        <div className="mt-2 text-3xl font-bold">{stats.total_stock}</div>
                    </div>
                    <div className="rounded-xl border border-sidebar-border/70 p-6 shadow-sm dark:border-sidebar-border">
                        <div className="text-sm font-medium text-muted-foreground">Total Nilai Inventori</div>
                        <div className="mt-2 text-3xl font-bold">{formatCurrency(stats.total_value)}</div>
                    </div>
                </div>
                
                <div className="rounded-xl border border-sidebar-border/70 p-6 shadow-sm dark:border-sidebar-border">
                    <h3 className="text-lg font-semibold">Selamat Datang!</h3>
                    <p className="mt-2 text-muted-foreground">
                        Ini adalah ringkasan inventori Anda. Anda dapat mengelola produk dengan web ini.
                    </p>
                </div>
            </div>
        </>
    );
}

Dashboard.layout = {
    breadcrumbs: [
        {
            title: 'Dashboard',
            href: dashboard(),
        },
    ],
};
