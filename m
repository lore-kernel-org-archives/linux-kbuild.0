Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33203 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754842Ab3BUXB5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 18:01:57 -0500
Message-ID: <5126A766.9070604@suse.cz>
Date: Fri, 22 Feb 2013 00:01:58 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: How to share variables with a sub-make command in a Kbuild Makefile?
References: <CAD=GYpa5OTy8Jd4Pevgabvc0J+mx6Ba+_K8iAsGPwD3Bc7hknw@mail.gmail.com>
In-Reply-To: <CAD=GYpa5OTy8Jd4Pevgabvc0J+mx6Ba+_K8iAsGPwD3Bc7hknw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel A Fernandes <agnel.joel@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 9.2.2013 17:34, Joel A Fernandes wrote:
> Hi,
> I am trying to create a patch that involves a call to a submake and
> sharing a variable with it.
> 
> The the top level Makefile is arch/arm/Makefile and has something like:
> dtbs: scripts
>    $(Q)$(MAKE) -e $(build)=$(boot)/dts MACHINE=$(MACHINE) dtbs
>    # Make use of share-var modified by the submake
>    echo $(share-var)
> 
> In the sub-make Makefile, I want to modify a variable and have it
> reflect in the top Makefile
> dtbs: $(addprefix $(obj)/, $(dtb-y))
>    $(Q)rm -f $(obj)/../*.dtb
>    share-var += "new stuff"

This is not possible, because we run a separate make process for every
subdirectory.

Michal

