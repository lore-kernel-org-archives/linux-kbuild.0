Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:57217 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755588Ab1EMFWf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 May 2011 01:22:35 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glkd-linux-kbuild@m.gmane.org>)
	id 1QKkpd-0002Yu-8w
	for linux-kbuild@vger.kernel.org; Fri, 13 May 2011 07:22:33 +0200
Received: from 60.247.97.98 ([60.247.97.98])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Fri, 13 May 2011 07:22:33 +0200
Received: from xiyou.wangcong by 60.247.97.98 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Fri, 13 May 2011 07:22:33 +0200
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH v2] package: Makefile: fix perf target bug
Date: Fri, 13 May 2011 05:22:20 +0000 (UTC)
Message-ID: <iqif6b$rg0$1@dough.gmane.org>
References: <BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
	<e5dfdb7d9a9909d6f9faa20c45115142ebce2ae2.1305244842.git.mfm@muteddisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 12 May 2011 17:09:03 -0700, mfmooney wrote:

> From: matt mooney <mfm@muteddisk.com>
> 
> Specify --git-dir and --work-tree when building perf targets to allow
> out-of-tree builds using O=<build-dir>.
> 
> The cat command had to be changed to allow proper file name expansion of
> the files listed in MANIFEST.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com> ---
> Okay, so I decided to just go ahead and send this. It removes the
> --work-tree option from the git rev-parse command. I did test it the way
> you said, without --work-tree on either statement, but the git archive
> command fails in that case.
> 

Looks like `git rev-parse` only needs the data in .git to work fine,
so this patch looks good to me,

Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

BTW, I think you need to Cc Ingo and Peter for perf changes.

Thanks.

