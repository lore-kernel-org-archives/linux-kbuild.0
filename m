Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48962 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751791AbaBJNvO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Feb 2014 08:51:14 -0500
Message-ID: <52F8D94D.4040307@suse.cz>
Date: Mon, 10 Feb 2014 14:51:09 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH RFC] kernel build: enable use of password-protected signing
 keys
References: <52F8034B.8080303@mykolab.com>
In-Reply-To: <52F8034B.8080303@mykolab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emily Maier <emilymaier@mykolab.com>, Rob Landley <rob@landley.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 9.2.2014 23:38, Emily Maier wrote:
> Currently, the module signing script assumes that the private key is 
> not password-protected. This patch makes it slightly more secure by 
> allowing it to be passed in on the command line as "make 
> modules_install MOD_PASSWORD=abc". It's vulnerable to snooping during 
> the build of course, but so is an unprotected signing key.

The key's permissions can be set to 0600, while the make commandline is
visible in ps.

Michal
