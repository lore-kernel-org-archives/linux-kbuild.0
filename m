Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35544 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755344AbaCNQdX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2014 12:33:23 -0400
Message-ID: <53232F51.3000404@suse.cz>
Date: Fri, 14 Mar 2014 17:33:21 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: enable use of password-protected signing keys
References: <52FD4E8F.2030905@mykolab.com>
In-Reply-To: <52FD4E8F.2030905@mykolab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emily Maier <emilymaier@mykolab.com>
Cc: Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014-02-14 00:00, Emily Maier wrote:
> Currently, the module signing script assumes that the private key is 
> not password-protected. This patch makes it somewhat more secure by 
> checking of a password file ("signing_key.pass") exists and passing it 
> to OpenSSL if so.

I doubt that this makes the key any more secure.

Michal

