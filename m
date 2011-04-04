Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:41898 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288Ab1DDMug (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Apr 2011 08:50:36 -0400
Subject: Re: [PATCH 2/2] kbuild: move KALLSYMS_EXTRA_PASS from Kconfig to
 Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
In-Reply-To: <4D99B6CC.7080707@suse.cz>
References: <1301913651-9055-1-git-send-email-dedekind1@gmail.com>
	 <1301913651-9055-2-git-send-email-dedekind1@gmail.com>
	 <4D99B6CC.7080707@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 15:48:04 +0300
Message-ID: <1301921284.2760.80.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Marques <pmarques@grupopie.com>

On Mon, 2011-04-04 at 14:17 +0200, Michal Marek wrote:
> > -ifdef CONFIG_KALLSYMS_EXTRA_PASS
> > -last_kallsyms := 3
> > -else
> >  last_kallsyms := 2
> > +ifeq ("$(origin KALLSYMS_EXTRA_PASS)", "command line")
> 
> I would drop the origin check here. We use it for single-letter
> variables that could be used outside the kernel with a different
> meaning, but if you export KALLSYMS_EXTRA_PASS, then you certainly mean
> the kernel's KALLSYMS_EXTRA_PASS.

Sure, I'll wait if there are more requests and re-send. There is a
missed white-space in the first patch as well which I'll fix.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

