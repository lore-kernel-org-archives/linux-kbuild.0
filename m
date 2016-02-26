Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49260 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbcBZLUb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Feb 2016 06:20:31 -0500
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1456417901-2192433-1-git-send-email-arnd@arndb.de>
References: <1456417901-2192433-1-git-send-email-arnd@arndb.de>
Subject: Re: [PATCH] modsign: hide openssl output in silent builds
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7538.1456485628.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date: Fri, 26 Feb 2016 11:20:28 +0000
Message-ID: <7539.1456485628@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> wrote:

> When a user calls 'make -s', we can assume they don't want to
> see any output except for warnings and errors, but instead
> they see this for a warning free build:
> 
>  ###
>  ### Now generating an X.509 key pair to be used for signing modules.
>  ###
>  ### If this takes a long time, you might wish to run rngd in the
>  ### background to keep the supply of entropy topped up.  It
>  ### needs to be run as root, and uses a hardware random
>  ### number generator if one is available.
>  ###
>  Generating a 4096 bit RSA private key
>  .................................................................................................................................................................................................................................++
>  ..............................................................................................................................++
>  writing new private key to 'certs/signing_key.pem'
>  -----
>  ###
>  ### Key pair generated.
>  ###
> 
> The output can confuse simple build testing scripts that just check
> for an empty build log.
> 
> This patch silences all the output:
>  - "echo" is changed to "@$(kecho)", which is dropped when "-s" gets
>    passed
>  - the openssl command itself is only printed with V=1, using the
>    $(Q) macro
>  - The output of openssl gets redircted to /dev/null on "-s" builds.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

David
