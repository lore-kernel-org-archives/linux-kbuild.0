Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48529 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753488Ab2AHNsk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jan 2012 08:48:40 -0500
Date: Sun, 8 Jan 2012 14:48:38 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/genksyms: clean lex/yacc generated files
Message-ID: <20120108134838.GB19887@sepie.suse.cz>
References: <4EE57241.90400@oss.ntt.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4EE57241.90400@oss.ntt.co.jp>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fernando Luis =?iso-8859-1?Q?V=E1zquez?= Cao <fernando@oss.ntt.co.jp>
Cc: linux-kbuild@vger.kernel.org

On Mon, Dec 12, 2011 at 12:17:21PM +0900, Fernando Luis Vázquez Cao wrote:
> Add "keywords.hash.c", "lex.lex.c", "parse.tab.c" and "parse.tab.h" to
> clean-list so that they get automagically deleted at clean/mrproper
> time.
> 
> Signed-off-by: Fernando Luis Vazquez Cao<fernando@oss.ntt.co.jp>
> ---

Applied, thanks.

Michal
