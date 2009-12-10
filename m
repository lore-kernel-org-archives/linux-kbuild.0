Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from static-71-162-243-5.phlapa.fios.verizon.net ([71.162.243.5]:38005
	"EHLO grelber.thyrsus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759380AbZLJBuz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2009 20:50:55 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3] Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Wed, 9 Dec 2009 19:50:58 -0600
References: <200912080317.08254.rob@landley.net> <200912091740.43147.rob@landley.net> <4B203691.7020203@zytor.com>
In-Reply-To: <4B203691.7020203@zytor.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912091950.58950.rob@landley.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wednesday 09 December 2009 17:45:21 H. Peter Anvin wrote:
> On 12/09/2009 03:40 PM, Rob Landley wrote:
> > This is why reducing the perl version to just the precomputed constants
> > wouldn't work either.  (They're there so that you only need to install a
> > random cpan library when surprised by a build break on non-x86 machines.)
>
> It's not "a random CPAN library" - it's a core module.

Then why cache large quantities of its output and test for its existence?

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
