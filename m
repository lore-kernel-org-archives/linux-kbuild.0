Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50410 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757752AbZLNQcz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 11:32:55 -0500
Message-ID: <4B2668B4.8080005@suse.cz>
Date: Mon, 14 Dec 2009 17:32:52 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz>    <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org>    <20091214100613.GA21769@sepie.suse.cz> <51737.84.105.60.153.1260797592.squirrel@gate.crashing.org>
In-Reply-To: <51737.84.105.60.153.1260797592.squirrel@gate.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

On 14.12.2009 14:33, Segher Boessenkool wrote:
> So the patch fixes a real problem.  I'm sorry for being dense.
> 
> Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks :). Rusty, I sent the patch to you because you have some other
modpost stuff in the rr tree. But I can add it to the kbuild tree as
well if you want.

Michal
