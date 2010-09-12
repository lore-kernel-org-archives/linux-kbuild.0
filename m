Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:46962 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751659Ab0ILRfV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Sep 2010 13:35:21 -0400
From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 2.6.36-rc3 - Unable to build: "Error: input truncated"
Date: Sun, 12 Sep 2010 19:34:36 +0200
References: <4C8CB5A1.9040500@tuxonice.net>
In-Reply-To: <4C8CB5A1.9040500@tuxonice.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201009121934.37033.rjw@sisk.pl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nigel Cunningham <nigel@tuxonice.net>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Sunday, September 12, 2010, Nigel Cunningham wrote:
> Hi all.
> 
> I'm unable to compile the latest kernel and git bisect isn't helping:

Did you try to save .config, run "make distclean" and restore .config?

Rafael
