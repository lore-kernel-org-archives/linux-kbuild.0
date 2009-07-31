Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:58574 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751403AbZGaMEG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2009 08:04:06 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <200907311227.20132.elendil@planet.nl>
References: <200907311227.20132.elendil@planet.nl>
Subject: Re: RomFS: enless loop during make oldconfig from 2.6.24 -> 2.6.31-rc4 (parisc)
Date: Fri, 31 Jul 2009 13:04:00 +0100
Message-ID: <4977.1249041840@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>

Frans Pop <elendil@planet.nl> wrote:

> # Linux kernel version: 2.6.24-rc3test

I presume this is not the version of the kernel you're using.  This RomFS
feature was not upstream back then.  What version are you using?

David
