Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52244 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754468AbeFTPfc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jun 2018 11:35:32 -0400
Date: Wed, 20 Jun 2018 10:35:28 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] Kbuild: fix mismatched if/endif pairs
Message-ID: <20180620153528.jbevuhgj3rgvcbte@treble>
References: <180617191612798b1a5d7a74c59e7905c31fd3f36f5d@stu.xidian.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <180617191612798b1a5d7a74c59e7905c31fd3f36f5d@stu.xidian.edu.cn>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Xi Ruoyao <ryxi@stu.xidian.edu.cn>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 17, 2018 at 06:16:07PM +0800, Xi Ruoyao wrote:
> In scripts/Makefile.build, there are two mismatched if/endif pairs.
> They stop the generation of orc unwind table if CONFIG_FTRACE_MCOUNT_RECORD
> is not set.  dmesg complains:
> 
> WARNING: WARNING: Bad or missing .orc_unwind table.  Disabling unwinder.
> 
> This comment moves an endif to match the if/endif pairs.
> 
> Signed-off-by: Xi Ruoyao <ryxi@stu.xidian.edu.cn>

Reviewed-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh
