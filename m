Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36421 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753892Ab1FXOIZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jun 2011 10:08:25 -0400
Message-ID: <4E049A57.1030003@suse.cz>
Date: Fri, 24 Jun 2011 16:08:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] kconfig: zconfdump() clean-up
References: <1305518795-9360-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1305518795-9360-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 16.5.2011 06:06, Arnaud Lacombe wrote:
> Hi Michal,
>
> The following patch is a summarize of changes I made in zconfdump() last week
> when debugging Yann's multiple choice issue. This might help debugging a bit,
> espectially by exposing the tree depth.
>
> Considering the following Kconfig:
>
> config A
>     bool "A"
> if A
> choice C
>     bool "C"
> config C1
>     bool "C1"
> config C2
>     bool "C2"
> endchoice
> endif # A
>
> config B
>     bool "B"
>     depends on ! A
> if B
> choice C
>     bool "C"
> config C1
>     bool "C1"
> config C2
>     bool "C2"
> endchoice
> endif # A
>
> It generates the following output, after menu_finalize():
>
> config A
>    boolean
>    symbol
>    prompt "A"
>
>          choice C
>            boolean
>            symbol
>            #choice
>            prompt "C" if A

Why not. zconfdump() is only used for debugging and you've been doing 
most of the kconfig work lately, so if this suits you, then I'll merge 
it. I only spotted one minor issue:

commit 21685d396a123a576bbe487651cb5cc04fa5f9a3
Author: Arnaud Lacombe <lacombar@gmail.com>
Date:   Tue May 10 22:55:20 2011 -0400

     kconfig/zconfdump(): output newline at the *end* of statement

puts the newline between the symbol statement and it's help text (if 
any). So if there is help text defined, it will appear attached to the 
next symbol. But it's not really an issue.

Michal
