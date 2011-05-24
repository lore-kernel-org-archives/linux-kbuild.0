Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:40184 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753495Ab1EXKrU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 06:47:20 -0400
Message-ID: <4DDB8CB4.2090701@suse.cz>
Date: Tue, 24 May 2011 12:47:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFCv2 00/13] Kbuild: factor parser rules
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>

On 23.5.2011 10:10, Arnaud Lacombe wrote:
> Hi,
>
> [ Original RFC and motivation can be found at:
> http://marc.info/?l=linux-kbuild&m=130456101131801&w=2 ]
>
> I tried to re-think the order in this serie to address Michal comments.
>
> Main changes since v1 are:
>   - include scripts/dtc/' parser in the scope of the patchset
>   - do not rename any parser source
>   - make lexer file name consistent, ie. name it %.lex.c, not lex.%.c
>   - rebase on top of v2.6.39
>
> A few notes:
>   - the parser should not include the lexer; however, this has the advantage to
>     avoid having to deals with the parser's header.
>   - the tuple ( "migrate parser to implicit rules", regen parser) should really
>     be one commit, to enforce bisect'ability
>
> Comments welcome!
>   - Arnaud

Hi,

thanks for the series, but I will probably not have time to review it 
before this merge window closes. So it will have to wait for .41 most 
likely.

Michal
