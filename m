Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:50262 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbeAYUmV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 15:42:21 -0500
Date: Thu, 25 Jan 2018 21:42:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Mutli-directory module Makefiles
Message-ID: <20180125204217.GA14181@ravnborg.org>
References: <20180122134607.00d77101@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180122134607.00d77101@cakuba.netronome.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jakub Kicinski <kubakici@wp.pl>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Jakub.

On Mon, Jan 22, 2018 at 01:46:07PM -0800, Jakub Kicinski wrote:
> Hi!
> 
> in drivers/net/ethernet/netronome/nfp there is a module which is built
> from C sources in 4 directories.  What is the best way to handle that?

Move all .c files to th same directory - like done for almost
all other drives.
In this case we have a directory: drivers/net/ethernet/netronome
which is just an indirection to nfp/
and nfp/ contains a structure with 25 .c files in subdirs.

With some careful renaming everything could reside in
one dir without loosing any structure.
And then the driver starts to look a bit
more like any other driver in the kernel.

And as an added benefit some of the other goodies like
building single files just works.

	Sam
