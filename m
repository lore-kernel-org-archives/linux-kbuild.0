Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:31490 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756945Ab2DIQCg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 12:02:36 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Date: Mon, 9 Apr 2012 18:02:29 +0200
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr> <20120409153006.GA28221@kroah.com>
In-Reply-To: <20120409153006.GA28221@kroah.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201204091802.29839.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Greg, All,

On Monday 09 April 2012 17:30:06 Greg KH wrote:
> On Mon, Apr 09, 2012 at 02:49:10PM +0200, Yann E. MORIN wrote:
> > Currently, scripts/config removes the leading double-quote from
> > string options, but leaves the trailing double-quote.
> > 
> > Also, double-quotes in a string are escaped, but scripts/config
> > does not unescape those when printing
> > 
> > Finally, scripts/config does not escape double-quotes when setting
> > string options.
[--SNIP--]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: stable@vger.kernel.org
> 
> How does this fit the Documentation/stable_kernel_rules.txt

Sorry, I was not aware of this list... My bad...
I'll know for next time. Thanks!

> qualification for a patch to be added to the stable releases?

I believe it qualifies because:
  - it is rather trivial
  - it breaks the build for users that tweak the kernel configuration from
    an upper-layer (aka 'integrated') build-system, using this script which
    is bundled with the kernel in the first place.
  - I am a 'real people', and 'it bothers' me ;-)

OTOH, it does not qualify because:
  - there is no Tested-by:
  - I forgot to specify which version it should be applied to
  - obviously, this fix is not yet in Linus' tree

So, please drop from -stable.

If you think that the first item, above, warrants a -stable fix, then I'll
properly re-submit once the patch is in Linus' tree.

Michal, should I re-send an updated patch whithout the CC:stable?

Sorry for the noise.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
