Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:33284 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389AbcDYOTA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 10:19:00 -0400
Received: by mail-qg0-f51.google.com with SMTP id f92so30470268qgf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2016 07:18:59 -0700 (PDT)
Date: Mon, 25 Apr 2016 10:18:56 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/3] kbuild: call adjust_autoksyms.sh from source
 directory
In-Reply-To: <1461590265-1397577-1-git-send-email-arnd@arndb.de>
Message-ID: <alpine.LFD.2.20.1604251015000.5091@knanqh.ubzr>
References: <1461590265-1397577-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 25 Apr 2016, Arnd Bergmann wrote:

> When building with separate object trees, scripts/adjust_autoksyms.sh
> cannot be called from the object directory:
> 
> /bin/bash: scripts/adjust_autoksyms.sh: No such file or directory
> 
> This adds a $(src) prefix, as we do for all other shell scripts.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I posted fixes for all those problems already, plus another.

You may grab them all at once from this branch where I committed them on 
top of Michal's kbuild branch:

	git://git.linaro.org/people/nicolas.pitre/linux kbuild


Nicolas
