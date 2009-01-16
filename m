Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:38483 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1761552AbZAPWTd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2009 17:19:33 -0500
Message-ID: <497107F1.6000208@snapgear.com>
Date: Sat, 17 Jan 2009 08:19:29 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
Subject: Re: [PATCH] m68k,m68knommu: merge header files
References: <20081208205814.GA22697@uranus.ravnborg.org> <20081213205251.GC27748@uranus.ravnborg.org> <20081213205828.GD27748@uranus.ravnborg.org> <49707AE0.1040803@opengear.com> <Pine.LNX.4.64.0901161354410.18756@anakin> <49709800.70009@snapgear.com> <20090116143429.GB22152@uranus.ravnborg.org> <Pine.LNX.4.64.0901162242010.25319@anakin>
In-Reply-To: <Pine.LNX.4.64.0901162242010.25319@anakin>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>


Hi Geert,

Geert Uytterhoeven wrote:
> On Fri, 16 Jan 2009, Sam Ravnborg wrote:
>>>>> More review, testing, comments welcome...
>>>>> Where to from here?
>>>> I'll pull from it and give it some m68k test builds.
>>>> After that, you can move it to for-next. If everything's well, it can go to
>>>> Linus.
>>> Sounds like a plan.
>>>
>>>
>>>> Or should I amend and add my SoB and put it in m68k for-next?
>>> I am happy to go either way.
>> For my part I like this to reach mainline ASAP. So whatever suits the
>> two of you is fine with me.
> 
> I pulled from Greg's tree, and built atari_defconfig, multi_defconfig,
> sun3_defconfig. Atari_defconfig runs fine under ARAnyM.
> 
> As I'll be on a business trip to Japan next week, I probably won't be able to
> do a proper follow-up. So Greg, can you put it on your for-next branch and
> send it to Linus if everything goes well?
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Yep, I can take care of that.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
