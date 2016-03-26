Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:58638 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753658AbcCZTAq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Mar 2016 15:00:46 -0400
Date: Sat, 26 Mar 2016 19:53:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: Add localdefconfig helper
Message-ID: <20160326185306.GA4133@ravnborg.org>
References: <1459017087-11640-1-git-send-email-contact@paulk.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459017087-11640-1-git-send-email-contact@paulk.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>

On Sat, Mar 26, 2016 at 07:31:27PM +0100, Paul Kocialkowski wrote:
> This introduces a localdefconfig make target to specify out-of-tree default
> configs. The out-of-tree default target is selected by defining
> KBUILD_LOCALDEFCONFIG in the make command line.
> 
> The intent of this change is to easily allow using default configs that are not
> part of the kernel source (e.g. for a specific device or use case), without ever
> touching the kernel source tree.
> 
Does this differ from what you can achieve with KCONFIG_ALLCONFIG?
See Documentation/kbuild/kconfig.txt

From a quick glance the functionality is the same.

	Sam
