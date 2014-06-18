Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45477 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751025AbaFROeA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2014 10:34:00 -0400
Message-ID: <53A1A354.7030107@suse.cz>
Date: Wed, 18 Jun 2014 16:33:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Regression: firmware: Simplify directory creation + b43 = fails
 to build
References: <CAF1_xX2oeG0YCLaLZR9ZUY2qiD0-sVB6L10dZppnae7iZV_U3g@mail.gmail.com>
In-Reply-To: <CAF1_xX2oeG0YCLaLZR9ZUY2qiD0-sVB6L10dZppnae7iZV_U3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ronald <ronald645@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 18.6.2014 10:46, Ronald napsal(a):
> Dear kernel developers,
> 
> Latest git HEAD (from Torvalds):
> 
>   CC      drivers/base/firmware_class.o
>   LD      drivers/base/built-in.o
>   MK_FW   firmware/b43/ucode5.fw.gen.S
> /bin/sh: firmware/b43/ucode5.fw.gen.S: Bestand of map bestaat niet
> (file or directory does not exist, it should not have the .gen.S
> suffix)
> /bin/sh: firmware/b43/ucode5.fw.gen.S: Bestand of map bestaat niet
> ... snip ...
> /bin/sh: firmware/b43/ucode5.fw.gen.S: Bestand of map bestaat niet
> firmware/Makefile:185: recept voor doel 'firmware/b43/ucode5.fw.gen.S'
> is mislukt
> make[1]: *** [firmware/b43/ucode5.fw.gen.S] Fout 1
> Makefile:893: recept voor doel 'firmware' is mislukt
> make: *** [firmware] Fout 2
> make: *** Wachten op onvoltooide taken...

Where does firmware/b43 come from?

Thanks,
Michal

