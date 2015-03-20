Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42370 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbbCTTR1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Mar 2015 15:17:27 -0400
Date: Fri, 20 Mar 2015 20:14:05 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [patch 0/7] dt: dtb version: add version info to dtb
Message-ID: <20150320191405.GE5664@pengutronix.de>
References: <550A42AC.8060104@gmail.com>
 <CAL_JsqJkrPubmM6m7KsaU9S=7j_qVq-U=dJ-500H2VDbT9CwdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJkrPubmM6m7KsaU9S=7j_qVq-U=dJ-500H2VDbT9CwdQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Michal Marek <mmarek@suse.cz>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>, Leif Lindholm <leif.lindholm@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello,

On Fri, Mar 20, 2015 at 08:46:09AM -0500, Rob Herring wrote:
> On Wed, Mar 18, 2015 at 10:29 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> > Can this be added to the next trees to get some test exposure before submitting
> > to Linus?
> 
> No. I've yet to see anyone think this is a good idea.
To push the balance a bit into the IMHO right direction: I think the
version info is a bad idea and fully agree with Russell's concerns.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
