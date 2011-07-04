Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4E11F1C6020000780004C089@nat28.tlf.novell.com>
Date: Mon, 04 Jul 2011 16:00:54 +0100
From: "Jan Beulich" <JBeulich@novell.com>
Subject: sorting of exports breaks modpost's GPL checking
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: abogani@kernel.org, linux-kbuild@vger.kernel.org
Cc: rusty@rustcorp.com.au

Is it known (and being worked on) that exported symbols residing
themselves in modules are no longer properly handled by modpost,
due to the .o files to be linked into .ko (other than vmlinux and the
.ko files) still carrying the ___ksymtab*+<symbol> sections?

If not - what are the thoughts to resolve this? It's not really obvious,
since
- doing the section sorting already when generating the .o-s is
  incompatible (at least) with .ko-s consisting of just a single .o,
- passing the .ko-s instead of the .o-s to modpost would create a
  chicken-and-egg situation, and
- adjusting modpost itself would require the tool to track all the
  ___ksymtab*+<symbol> section (i.e. causing possibly measurable
  extra overhead).

Thanks, Jan

