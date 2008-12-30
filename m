Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.184]:46460 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580AbYL3HgW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Dec 2008 02:36:22 -0500
Received: by ti-out-0910.google.com with SMTP id b6so7984496tic.23
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2008 23:36:20 -0800 (PST)
Message-ID: <df9815e70812292336h613585f2i217eeff47a6a9f2e@mail.gmail.com>
Date: Tue, 30 Dec 2008 15:36:19 +0800
From: "Jike Song" <albcamus@gmail.com>
Subject: Re: Do we really need file `all'?
In-Reply-To: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <df9815e70812292217p65b6285eo7a7909c0f6899e6e@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

On Tue, Dec 30, 2008 at 2:17 PM, Jike Song <albcamus@gmail.com> wrote:
> Hi Sam,
>
>  In commit a680eedc6c621c75695c68198533fc3c98f4053b you introduced the
> following code:
>
>        exuberant()
>        {
>                all_sources > all
>                all_sources | xargs ....{snip}...
>
> This will generate a regular file named `all' in the repository, which
> is not included in .gitignore.
> Do we really need this file? I think the second run of all_source is
> enough.  Or otherwise should
> we add it into .gitignore?
>
> I'm not subscribing linux-kbuild list so please CC me in replies, thanks.
>

Besides, there are still some asm-{arch} under include/ now.  The
current kbuild/scripts will find them by default, which seems not to
be a good idea:


$ grep "include/asm-" cscope.files |awk -F"/" '{ print $2 }'|uniq
asm-generic
asm-frv
asm-h8300
asm-m68k
asm-mn10300
asm-m32r
asm-arm
asm-xtensa


-- 
Thanks,
Jike
