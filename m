Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:49352 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751078AbdDREoX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 00:44:23 -0400
Date: Tue, 18 Apr 2017 06:44:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
Message-ID: <20170418044418.GA10137@ravnborg.org>
References: <20170418010011.GC4152@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170418010011.GC4152@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Tue, Apr 18, 2017 at 02:00:11AM +0100, Ben Hutchings wrote:
> This definition in Makefile.dtbinst:
> 
>     export dtbinst-root ?= $(obj)
> 
> should define and export dtbinst-root when handling the root dts
> directory, and do nothing in the subdirectories.  However, the
> variable does not reliably get exported to the environment, perhaps
> because its name contains a hyphen.
> 
> Rename the variable to dtbinst_root.

Exported environment variables are usually in UPPPER CASE.
And also listed in: Documentation/kbuild/kbuild.txt

There are deviations from this already, so not something
that is followed by all of kbuild.

	Sam
