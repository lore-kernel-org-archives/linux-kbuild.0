Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]:31865
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751389Ab2BOQg4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Feb 2012 11:36:56 -0500
Date: Wed, 15 Feb 2012 17:36:45 +0100
From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH] builddeb: Don't create files in /tmp with predictable
 names
Message-ID: <20120215163645.GG2238@amd.com>
References: <1329315449.3048.78.camel@deadeye>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1329315449.3048.78.camel@deadeye>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>, Maximilian Attems <max@stro.at>

On Wed, Feb 15, 2012 at 02:17:29PM +0000, Ben Hutchings wrote:
> The current use of /tmp for file lists is insecure.  Put them under
> $objtree/debian instead.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: stable@vger.kernel.org
> ---
> Joerg, this will textually conflict with your changes.  Sorry about
> that, but I think it has to go ahead of them.

No problem. It was easy to rebase. I am about to send a new version.


	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

