Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:43882 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbZLaWos (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Dec 2009 17:44:48 -0500
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT uImages
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
In-reply-to: <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com> <1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
Date: Thu, 31 Dec 2009 23:44:39 +0100
Message-Id: <20091231224439.AF5353F6D1@gemini.denx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Dear Grant Likely,

In message <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com> you wrote:
>
> IIRC, uImage.fit.initrd.% should appear before uImage.fit.% in the
> Makefile so that make behaves more consistently.  Speaking of which,
> the number of '.' in the name is getting rather large.  Would you
> consider using 'fitImage' instead of 'uImage.fit'?

Why chose a different name at all? We could still call it "uImage",
meaning "U-Boot image" - U-Boot is clever enought o detect
automatically if we pass it an old style or a fit image.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
If the odds are a million to one against something occuring,  chances
are 50-50 it will.
