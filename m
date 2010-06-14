Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:20829 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753963Ab0FNU0W (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Jun 2010 16:26:22 -0400
Date: Mon, 14 Jun 2010 13:26:16 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 1/1] kbuild: fix LOCALVERSION handling to match
 description
In-Reply-To: <1276508470-21731-1-git-send-email-apw@canonical.com>
Message-ID: <alpine.DEB.2.00.1006141325080.25461@chino.kir.corp.google.com>
References: <1276508470-21731-1-git-send-email-apw@canonical.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Whitcroft <apw@canonical.com>
Cc: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 14 Jun 2010, Andy Whitcroft wrote:

> In the commit below the version string handling was modified, adding
> a '+' where no other version information was supplied:
> 
>     commit 85a256d8e0116c8f5ad276730830f5d4d473344d
>     Author: David Rientjes <rientjes@google.com>
>     Date:   Wed Jan 13 13:01:05 2010 -0800
> 
> From the commit the intent was as below:
> 
>      - when CONFIG_LOCALVERSION_AUTO is disabled, a `+' is appended if the
>        repository has been revised beyond a tagged commit and LOCALVERSION=
>        was not passed to "make".
> 
> However if the user supplies an empty LOCALVERSION on the command line
> the plus suffix is still added.  This form is useful in the case where
> the build environment knows that the version as specified is correct and
> complete but does not correspond to a specific tag.
> 
> This patch changes the implementation to match the documentation
> such that specifying LOCALVERSION= on the build line is sufficient
> to suppress any suffix.
> 
> Signed-off-by: Andy Whitcroft <apw@canonical.com>

Acked-by: David Rientjes <rientjes@google.com>

This should be pushed for rc4.
