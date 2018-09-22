Set( %Lifecycles,
    orders => {
        initial     => [qw(new)], # loc_qw
        active      => [qw(open in-progress waiting shipped)], # loc_qw
        inactive    => [qw(completed canceled deleted)], # loc_qw
        defaults    => {
            on_create           => 'new',
            approved            => 'open',
            denied              => 'canceled',
            reminder_on_open    => 'open',
            reminder_on_resolve => 'completed',
        },
        transitions => {
            ""              => [qw(new open completed)],
            new             => [qw(    open in-progress waiting shipped completed canceled deleted)],
            open            => [qw(new      in-progress waiting shipped completed canceled deleted)],
            'in-progress'   => [qw(new open             waiting shipped completed canceled deleted)],
            waiting         => [qw(new open in-progress         shipped completed canceled deleted)],
            shipped         => [qw(new open in-progress waiting         completed canceled deleted)],
            completed       => [qw(new open in-progress waiting shipped           canceled deleted)],
            canceled        => [qw(new open in-progress waiting shipped completed          deleted)],
            deleted         => [qw(new open in-progress waiting shipped completed canceled        )],
        },
        actions     => {
            'new -> open'           => { label  => 'Open',    update => 'Respond' }, # loc{label}
            'new -> completed'      => { label  => 'Complete',update => 'Respond' }, # loc{label}
            'new -> canceled'       => { label  => 'Cancel',  update => 'Comment' }, # loc{label}
            'new -> deleted'        => { label  => 'Delete',                      }, # loc{label}
            'open -> waiting'       => { label  => 'Stall',   update => 'Comment' }, # loc{label}
            'open -> completed'     => { label  => 'Complete',update => 'Respond' }, # loc{label}
            'open -> canceled'      => { label  => 'Cancel',  update => 'Respond' }, # loc{label}
            'waiting -> open'       => { label  => 'Open',                        }, # loc{label}
            'in-progress -> shipped'=> { label  => 'Ship',    update => 'Respond' }, # loc{label}
            'shipped -> completed'  => { label  => 'Complete',update => 'Respond' }, # loc{label}
            'completed -> open'     => { label  => 'Re-open', update => 'Comment' }, # loc{label}
            'canceled -> open'      => { label  => 'Re-open', update => 'Comment' }, # loc{label}
            'deleted -> open'       => { label  => 'Undelete',                    }, # loc{label}        ],
        },
    },
    __maps__ => {
        'orders -> default' => {
            'new'           => 'new',
            'open'          => 'open',
            'in-progress'   => 'open',
            'waiting'       => 'stalled',
            'shipped'       => 'open',
            'completed'     => 'resolved',
            'canceled'      => 'rejected',
            'deleted'       => 'deleted',
        },
        'default -> orders' => {
            'new'           => 'new',
            'open'          => 'open',
            'stalled'       => 'waiting',
            'resolved'      => 'completed',
            'rejected'      => 'canceled',
            'deleted'       => 'deleted',
        },
    },
);
