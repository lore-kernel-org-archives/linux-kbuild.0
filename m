Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43071 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgBMSHn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 13:07:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so7818202wrq.10
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2020 10:07:42 -0800 (PST)
Date: Thu, 13 Feb 2020 18:07:36 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [kbuild-all] Re: [PATCH v3 3/3] kbuild: generate autoksyms.h
 early
Message-ID: <20200213180736.GA157895@google.com>
References: <20200207180755.100561-4-qperret@google.com>
 <202002111002.wXBhAK5H%lkp@intel.com>
 <20200212195628.GA120870@google.com>
 <20200213084251.GU12867@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213084251.GU12867@shao2-debian>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel test robot <rong.a.chen@intel.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org, masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Thursday 13 Feb 2020 at 16:42:51 (+0800), kernel test robot wrote:
> I attached the build log for your reference.

Thanks!

<snip>
> scripts/kconfig/conf  --syncconfig Kconfig
>   SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>   UPD     include/config/kernel.release
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   UPD     include/generated/utsrelease.h
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
> ./scripts/gen_autoksyms.sh: 24: ./scripts/gen_autoksyms.sh: [[: not found
> ./scripts/gen_autoksyms.sh: 35: ./scripts/gen_autoksyms.sh: [[: not found
> cat: /home/nfs/linux//dev/null: No such file or directory

OK, so that's the issue, which Nicolas pointed out earlier. That should
be fixed in v4.

Thanks,
Quentin
