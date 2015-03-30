Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:52197 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752597AbbC3N00 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 09:26:26 -0400
Date: Mon, 30 Mar 2015 14:26:17 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH 2/2] Kbuild: avoid partial linking of
 drivers/built-in.o
Message-ID: <20150330132617.GI24899@n2100.arm.linux.org.uk>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
 <1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
 <551943CB.3010303@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551943CB.3010303@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de

On Mon, Mar 30, 2015 at 02:38:35PM +0200, Michal Marek wrote:
> Is this a limitation of a particular ARM ABI or a limitation of a state
> of the art ARM linker or something else?

It's a limitation of the ARM ISA.

Normal PC-relative branches, which are emitted by the C compiler, can
branch +/- 32MB for ARM, or +/- 16MB of Thumb.  Beyond that, the address
offset is not representable in the instruction.

To get around that "modern" linkers are able to insert stubs as
necessary inbetween the object .text sections to extend the range of
these branches (by emitting a chunk of code possibly with some data to
extend the range of the branch.)

Obviously, gcc can't know before hand that the sum total of all the
small object files is going to cause problems, so the compiler can't
do this on an "as necessary basis".

For most practical kernels, this is not a problem; they normally fit
within the PC-relative range.  However, the exception is allyesconfig.

The question is: how far do we go with allyesconfig... do we want it
to work, or is reaching the final link sufficient?  If we do tweak
stuff to allow the link to work, are we going to try running it?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
