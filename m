Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38793 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753173Ab1JKMaC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Oct 2011 08:30:02 -0400
Message-ID: <4E9436CB.9050604@suse.cz>
Date: Tue, 11 Oct 2011 14:30:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kconfig: single-config-entry choice groups
References: <1318276961.18122.30.camel@x61.thuisdomein>
In-Reply-To: <1318276961.18122.30.camel@x61.thuisdomein>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org

On 10.10.2011 22:02, Paul Bolle wrote:
> 0) There seem to be about two dozen single-config-entry choice groups in
> Kconfig files across the tree: choice groups that let one set exactly
> one CONFIG option. (Most of the time hat CONFIG option is also the
> choice group's default. That doesn't seem to matter, though. The default
> could as well be some bogus symbol.)
> 
> 1) These choice groups are not optional, so there's nothing to actually
> choose. As far as I can see that single CONFIG option will always be
> set.
> 
> 2) Are single-config-entry choice groups some special, but undocumented,
> idiom?

My guess is that this is simply bitrot. Can you share the list of these
single-entry choice groups?

Michal
