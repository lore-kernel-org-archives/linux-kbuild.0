Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:54386 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753170Ab3CRT5f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Mar 2013 15:57:35 -0400
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [U-Boot] [RFC] Kbuild support for ARM FIT images
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
In-reply-to: <51475997.2060008@wwwdotorg.org>
References: <CAD=GYpbF_3uRzhUnV=MwDiy-ekvZKJztJbkhNM0u_pvG-UCw4w@mail.gmail.com> <20130222160044.GA16357@quad.lixom.net> <20130318163648.GA3722@amd.pavel.ucw.cz> <20130318164426.GI30923@n2100.arm.linux.org.uk> <20130318174931.GB4230@amd.pavel.ucw.cz> <20130318175746.GJ30923@n2100.arm.linux.org.uk> <20130318180458.GC4230@amd.pavel.ucw.cz> <51475997.2060008@wwwdotorg.org>
Date: Mon, 18 Mar 2013 20:57:25 +0100
Message-Id: <20130318195725.CA8132014B1@gemini.denx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Pavel Machek <pavel@denx.de>, "Fernandes, Joel A" <joelagnel@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, tony@atomide.com, Grant Likely <grant.likely@secretlab.ca>, u-boot@lists.denx.de, "Rini, Tom" <trini@ti.com>, Grant Likely <glikely@secretlab.ca>, Linux OMAP List <linux-omap@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>

Dear Stephen,

In message <51475997.2060008@wwwdotorg.org> you wrote:
>
> Raw zImage /is/ the useful format that should be adopted.

This "one size fits all" approch does fit everywhere.  There are a
number of users (including _big_ commercial ones, with _large_ numebrs
of systems in the field) that have simple requirements like:

- how can I find out if the image I just loaded to RAM in OK (OK
  maning some checksum is correct, or some crypto-key could be
  verified, or ...) ?

- how can I find out which version of image is installed on this
  device in the flash?  Can I print something like an ID string, or a
  build timestamp, etc?

etc. etc.

zImage may work well in many cases, but there are also many cases
where in image format that allows for additional meta-data is
mandatory.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Minds are like parachutes - they only function when open.
