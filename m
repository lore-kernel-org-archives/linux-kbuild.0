Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:38674 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755007Ab1GEJgu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Jul 2011 05:36:50 -0400
Received: by fxd18 with SMTP id 18so6012912fxd.11
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Jul 2011 02:36:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E11F1C6020000780004C089@nat28.tlf.novell.com>
References: <4E11F1C6020000780004C089@nat28.tlf.novell.com>
Date: Tue, 5 Jul 2011 11:36:48 +0200
Message-ID: <CAPk1OjGKD+i=RkfMq9GX_HeOdNSH1o5Bp2Ge6QXGy0edi+1kSQ@mail.gmail.com>
Subject: Re: sorting of exports breaks modpost's GPL checking
From: Alessio Igor Bogani <abogani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org, rusty@rustcorp.com.au

Dear Mr. Beulich,

2011/7/4 Jan Beulich <JBeulich@novell.com>:
> Is it known (and being worked on) that exported symbols residing
> themselves in modules are no longer properly handled by modpost,
> due to the .o files to be linked into .ko (other than vmlinux and the
> .ko files) still carrying the ___ksymtab*+<symbol> sections?
>
> If not - what are the thoughts to resolve this?
[...]

Could you tell me how reproduce the problem?

Thanks!

Ciao,
Alessio
