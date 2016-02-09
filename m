Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:34612 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270AbcBIEa4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 23:30:56 -0500
Received: by mail-qg0-f45.google.com with SMTP id b67so46105558qgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 20:30:56 -0800 (PST)
Date: Mon, 8 Feb 2016 23:30:53 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 6/6] kconfig option for TRIM_UNUSED_EXPSYMS
In-Reply-To: <8737t21uib.fsf@rustcorp.com.au>
Message-ID: <alpine.LFD.2.20.1602082330340.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org> <8737t21uib.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>

On Tue, 9 Feb 2016, Rusty Russell wrote:

> Nicolas Pitre <nicolas.pitre@linaro.org> writes:
> > The config option to enable it all.
> >
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> Nice series!  In case you need it, here's my Ack.  Despite the overlap
> with modules, it's all build trickery, so best via Sam's tree.
> 
> Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks


Nicolas
