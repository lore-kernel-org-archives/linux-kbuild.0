Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44452 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754400Ab1KAX0M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Nov 2011 19:26:12 -0400
Message-ID: <4EB08014.8010004@suse.cz>
Date: Wed, 02 Nov 2011 00:26:12 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] genksyms: Ignore changes to internal files
References: <1318327969-24807-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <1318327969-24807-1-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 11.10.2011 12:12, Michal Marek wrote:
> Hi,
> 
> this series teaches genksyms to ignore changes to internal files (those
> defined in the source file itself). See patch 2/3 for the main part.
> 
> Michal
> 
> 
> Michal Marek (3):
>   genksyms: Minor parser cleanup
>   genksyms: Do not expand internal types
>   genksyms: Regenerate lexer and parser

Looks like nobody besides me cares about genksyms :). I applied this to
my kbuild branch now.

Michal
