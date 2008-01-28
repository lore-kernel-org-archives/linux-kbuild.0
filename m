Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:47591 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754261AbYA1ViJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jan 2008 16:38:09 -0500
Date: Mon, 28 Jan 2008 22:38:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC] __ref annotation of function/data referencing __init/__exit
Message-ID: <20080128213811.GE3842@uranus.ravnborg.org>
References: <20080126184454.GA25591@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080126184454.GA25591@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Jan 26, 2008 at 07:44:54PM +0100, Sam Ravnborg wrote:
> Today we have the following annotations for functions/data
> referencing __init/__exit functions / data:
> 
> __init_refok for functions
> __initdata_refok for data
> 
> and
> _exit_refok for functions
> 
> To simplify it and to introduce a shorter annotation I
> will suggest the following annotation:
> 
> __ref      <= for functions (code) that
>               references __*init / __*exit
> __refdata  <= for variables
> __refconst <= for const variables
>

This patch was includedin todays kbuild.git submission
as I heard no negative feedback.

	Sam
