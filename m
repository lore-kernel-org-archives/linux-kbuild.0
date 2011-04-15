Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:45822 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755436Ab1DOOJ3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Apr 2011 10:09:29 -0400
Subject: Re: [PATCH v2 2/2] kbuild: move KALLSYMS_EXTRA_PASS from Kconfig
 to Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
In-Reply-To: <4DA8515C.4050905@suse.cz>
References: <1301999098-21412-1-git-send-email-dedekind1@gmail.com>
	 <1301999098-21412-2-git-send-email-dedekind1@gmail.com>
	 <4DA8515C.4050905@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Apr 2011 17:06:33 +0300
Message-ID: <1302876393.3220.63.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Marques <pmarques@grupopie.com>, Randy Dunlap <rdunlap@xenotime.net>

On Fri, 2011-04-15 at 16:08 +0200, Michal Marek wrote:
> I merged the patches, but removed the make help text. Rationale: People 
> who don't need it don't need the help text, for those that need it the 
> help text wouldn't provide more information than the error message. Is 
> this OK with you?

Yes, fine, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

