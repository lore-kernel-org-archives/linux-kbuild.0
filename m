Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:60546 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759381AbZLJCAE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2009 21:00:04 -0500
Message-ID: <4B2054A6.6040502@zytor.com>
Date: Wed, 09 Dec 2009 17:53:42 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] Replace kernel/timeconst.pl with kernel/timeconst.sh
References: <200912080317.08254.rob@landley.net> <200912091740.43147.rob@landley.net> <4B203691.7020203@zytor.com> <200912091950.58950.rob@landley.net>
In-Reply-To: <200912091950.58950.rob@landley.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 12/09/2009 05:50 PM, Rob Landley wrote:
> On Wednesday 09 December 2009 17:45:21 H. Peter Anvin wrote:
>> On 12/09/2009 03:40 PM, Rob Landley wrote:
>>> This is why reducing the perl version to just the precomputed constants
>>> wouldn't work either.  (They're there so that you only need to install a
>>> random cpan library when surprised by a build break on non-x86 machines.)
>>
>> It's not "a random CPAN library" - it's a core module.
> 
> Then why cache large quantities of its output and test for its existence?
> 

To support archaic Perl versions and Perl binaries without libraries.

	-hpa

