Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36435 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755301Ab0ICMKf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Sep 2010 08:10:35 -0400
Message-ID: <4C80E5B9.3080405@suse.cz>
Date: Fri, 03 Sep 2010 14:10:33 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: scripts/setlocalversion: information retrieval about git	repository
 state
References: <2010-08-25T00-33-12@devnull.michael-prokop.at> <4C77CB27.1070700@suse.cz> <2010-09-03T13-54-06@devnull.michael-prokop.at>
In-Reply-To: <2010-09-03T13-54-06@devnull.michael-prokop.at>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Prokop <mika@grml.org>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org

On 3.9.2010 13:58, Michael Prokop wrote:
> My issue is still valid though: scripts/setlocalversion of recent
> kernel versions should be adjusted -> either check for the untagged
> state or clarify/improve the comment about it. :)
> 
> I'd provide a patch for that if you let me know what's the way to
> go.

Please update the comment. What the script is looking for are the
"official" release tags, like v2.6.35, which are annotated and signed.

Thanks,
Michal
