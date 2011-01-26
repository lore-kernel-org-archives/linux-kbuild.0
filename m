Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D3FF944020000780002E872@vpn.id2.novell.com>
Date: Wed, 26 Jan 2011 09:36:52 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Do we still need -C in cmd_cpp_lds_S?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This got introduced universally for all arches when (for 2.5.32) the
rule got made common (ia64, mips64, and sh had -C in their rules).
It seems questionable to me that this is needed at all, but if some
arch indeed needs it for whatever reason, couldn't this be put in
arch/$(ARCH)/Makefile's customization of CPPFLAGS_vmlinux.lds?

The point being that -C results in pre-processing directives to be
retained (confusing ld) if they follow a comment on the same line,
thus placing unnecessary restrictions on (potentially generated)
header files.

Thanks, Jan

