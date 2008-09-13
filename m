Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hpsmtp-eml13.kpnxchange.com ([213.75.38.113]:53521 "EHLO
	hpsmtp-eml13.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752009AbYIMQnH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Sep 2008 12:43:07 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] Fixup deb-pkg target to generate separate firmware deb.
Date: Sat, 13 Sep 2008 18:28:53 +0200
References: <20080912112042.GX30927@earth.li> <200809131035.18477.elendil@planet.nl> <20080913160831.GE30927@earth.li>
In-Reply-To: <20080913160831.GE30927@earth.li>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200809131828.54286.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Saturday 13 September 2008, Jonathan McDowell wrote:
> Ta, I've fixed both the indents. I've also changed the firmware package
> to be arch: all.

Although I agree that arch all is technically not incorrect, I wonder if 
it is the smart thing to do it here.

The pkg-deb target is probably mostly, or even exclusively - used to build 
custom kernels, and people might be crossbuilding kernels with different 
configs and thus resulting in different firmware files from the same 
source (thus same version) on the same system.
I build amd64, i386 and armel that way on my main desktop system, all with 
different configs (tuned mainly to keep the build time down).

Keeping the firmware package arch-specific would ensure that a firmware 
package built with the config for one arch does not get overwritten by 
one built for another arch with a different config.

Cheers,
FJP
