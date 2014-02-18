Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:42179 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755560AbaBROff (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:35:35 -0500
Message-ID: <53036F93.3030803@zytor.com>
Date: Tue, 18 Feb 2014 06:34:59 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Link Time Optimization patchkit v3
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On 02/18/2014 06:28 AM, Andi Kleen wrote:
> LTO allows the compiler to do global optimization over the whole kernel.
> 
> Updated version of the LTO patchkit, mainly for fixing Sam's review
> comments.  I also rebased to 3.14-rc3 and added a fix for bloat-o-meter
> with gcc 4.9
> 
> See the individual patches for a detailed description
> 
> Dependencies: asmlinkage patchkit (posted two weeks ago), kallsyms patchkit
> (plus LTO capable toolchain, see documentation)
> 
> Full git tree is in
> git://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc lto-3.14
> 

Michal, Sam, when this patchset is done, do you want to take it in your
tree or should I?

	-hpa



