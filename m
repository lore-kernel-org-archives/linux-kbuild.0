Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:50899 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781Ab0AIAIM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jan 2010 19:08:12 -0500
Message-ID: <4B47C8C7.1010507@zytor.com>
Date: Fri, 08 Jan 2010 16:07:35 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: do not override LC_CTYPE
References: <20100108115745.GA14758@sepie.suse.cz> <1262952988-16563-1-git-send-email-mmarek@suse.cz> <20100109000008.GB2319@verge.net.au>
In-Reply-To: <20100109000008.GB2319@verge.net.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: Michal Marek <mmarek@suse.cz>, Masami Hiramatsu <mhiramat@redhat.com>, Roland Dreier <rdreier@cisco.com>, Sam Ravnborg <sam@ravnborg.org>, Sergei Trofimovich <slyfox@inbox.ru>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org

On 01/08/2010 04:00 PM, Simon Horman wrote:
> 
> Personally I think it would be much better to set the locale explicitly
> as needed, where needed, such as the LC_ALL=C sledgehammer that you
> have inserted into arch/sh/tools. Or at a slightly higher level,
> offer an awk-wrapper, as it seems to be the main (only?) cause of concern.
> 

awk, sed, shell scripts, etc. all have the same problem.

	-hpa
