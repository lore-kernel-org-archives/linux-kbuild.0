Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56660 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755732AbbKRRpO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2015 12:45:14 -0500
Subject: Re: [PATCH] staging: drop kbuild workaround dummy module from top dir
References: <1447721929-45813-1-git-send-email-paul.gortmaker@windriver.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <564CB927.5020105@suse.com>
Date: Wed, 18 Nov 2015 18:45:11 +0100
MIME-Version: 1.0
In-Reply-To: <1447721929-45813-1-git-send-email-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 17.11.2015 v 01:58 Paul Gortmaker napsal(a):
> This is essentially a revert of 86f69fe9c069dd8608d238581eea259caa1dfc99
> ("Staging: workaround build system bug"), but to call it a revert would
> imply it was wrong -- rather it seems more like it is just no longer
> required anymore.

Acked-by: Michal Marek <mmarek@suse.com>

In fact, I can't even reproduce the original bug with 2.6.27 + the
initial staging series. I also do not remember any fix for such bug in
the recent years. 4b024242e8a4 ("kbuild: Fix linking error built-in.o no
such file or directory") is related, but fixing a different problem.

Michal
