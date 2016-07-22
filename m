Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48080 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753877AbcGVL4H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jul 2016 07:56:07 -0400
Subject: Re: [PATCH 2/2] kbuild: add shell cache
References: <1467052107-26735-1-git-send-email-rabin@rab.in>
 <1467052107-26735-2-git-send-email-rabin@rab.in>
From: Michal Marek <mmarek@suse.com>
Message-ID: <579209D3.10300@suse.com>
Date: Fri, 22 Jul 2016 13:56:03 +0200
MIME-Version: 1.0
In-Reply-To: <1467052107-26735-2-git-send-email-rabin@rab.in>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rabin Vincent <rabin@rab.in>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-06-27 20:28, Rabin Vincent wrote:
> Running make results in over 40 invocations of the compiler just during
> processing of the Makefile, before any actual rules are run.
> 
> To reduce this overhead, cache the results of $(shell) calls to the
> compiler.

How do you detect when the compiler gets updated?

Thanks,
Michal

