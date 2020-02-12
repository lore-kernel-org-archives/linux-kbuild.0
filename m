Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51275 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgBLT4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 14:56:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so3722790wmi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 11:56:33 -0800 (PST)
Date: Wed, 12 Feb 2020 19:56:28 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200212195628.GA120870@google.com>
References: <20200207180755.100561-4-qperret@google.com>
 <202002111002.wXBhAK5H%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202002111002.wXBhAK5H%lkp@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Tuesday 11 Feb 2020 at 10:14:14 (+0800), kbuild test robot wrote:
> Hi Quentin,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on linux/master linus/master v5.6-rc1 next-20200210]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Quentin-Perret/kbuild-allow-symbol-whitelisting-with-TRIM_UNUSED_KSYM/20200211-020659
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: i386-randconfig-c002-20200211 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: "trace_event_raw_init" [lib/objagg.ko] undefined!
> >> ERROR: "trace_event_reg" [lib/objagg.ko] undefined!
> >> ERROR: "ida_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_order_trace" [lib/objagg.ko] undefined!
> >> ERROR: "sort" [lib/objagg.ko] undefined!
> >> ERROR: "__raw_spin_lock_init" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_init" [lib/objagg.ko] undefined!
> >> ERROR: "rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "__list_del_entry_valid" [lib/objagg.ko] undefined!
> >> ERROR: "__rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "kmem_cache_alloc_trace" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_caches" [lib/objagg.ko] undefined!
> >> ERROR: "queue_work_on" [lib/objagg.ko] undefined!
> >> ERROR: "system_wq" [lib/objagg.ko] undefined!
> >> ERROR: "kfree" [lib/objagg.ko] undefined!
> >> ERROR: "__list_add_valid" [lib/objagg.ko] undefined!
> >> ERROR: "lockdep_rht_bucket_is_held" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_insert_slow" [lib/objagg.ko] undefined!
> >> ERROR: "__local_bh_enable_ip" [lib/objagg.ko] undefined!

I find myself unable to reproduce this error on my box. Could you please
provide the full build log ?

In the meantime I'll proceed to send a v4.

Thanks,
Quentin
