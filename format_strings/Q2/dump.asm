
flag:     file format elf32-i386


Disassembly of section .init:

0804830c <_init>:
 804830c:	53                   	push   %ebx
 804830d:	83 ec 08             	sub    $0x8,%esp
 8048310:	e8 db 00 00 00       	call   80483f0 <__x86.get_pc_thunk.bx>
 8048315:	81 c3 eb 1c 00 00    	add    $0x1ceb,%ebx
 804831b:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048321:	85 c0                	test   %eax,%eax
 8048323:	74 05                	je     804832a <_init+0x1e>
 8048325:	e8 66 00 00 00       	call   8048390 <__gmon_start__@plt>
 804832a:	83 c4 08             	add    $0x8,%esp
 804832d:	5b                   	pop    %ebx
 804832e:	c3                   	ret    

Disassembly of section .plt:

08048330 <.plt>:
 8048330:	ff 35 04 a0 04 08    	push   0x804a004
 8048336:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804833c:	00 00                	add    %al,(%eax)
	...

08048340 <printf@plt>:
 8048340:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048346:	68 00 00 00 00       	push   $0x0
 804834b:	e9 e0 ff ff ff       	jmp    8048330 <.plt>

08048350 <gets@plt>:
 8048350:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048356:	68 08 00 00 00       	push   $0x8
 804835b:	e9 d0 ff ff ff       	jmp    8048330 <.plt>

08048360 <puts@plt>:
 8048360:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048366:	68 10 00 00 00       	push   $0x10
 804836b:	e9 c0 ff ff ff       	jmp    8048330 <.plt>

08048370 <__libc_start_main@plt>:
 8048370:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048376:	68 18 00 00 00       	push   $0x18
 804837b:	e9 b0 ff ff ff       	jmp    8048330 <.plt>

08048380 <putchar@plt>:
 8048380:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 8048386:	68 20 00 00 00       	push   $0x20
 804838b:	e9 a0 ff ff ff       	jmp    8048330 <.plt>

Disassembly of section .plt.got:

08048390 <__gmon_start__@plt>:
 8048390:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048396:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

080483a0 <_start>:
 80483a0:	31 ed                	xor    %ebp,%ebp
 80483a2:	5e                   	pop    %esi
 80483a3:	89 e1                	mov    %esp,%ecx
 80483a5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483a8:	50                   	push   %eax
 80483a9:	54                   	push   %esp
 80483aa:	52                   	push   %edx
 80483ab:	e8 23 00 00 00       	call   80483d3 <_start+0x33>
 80483b0:	81 c3 50 1c 00 00    	add    $0x1c50,%ebx
 80483b6:	8d 83 d0 e5 ff ff    	lea    -0x1a30(%ebx),%eax
 80483bc:	50                   	push   %eax
 80483bd:	8d 83 70 e5 ff ff    	lea    -0x1a90(%ebx),%eax
 80483c3:	50                   	push   %eax
 80483c4:	51                   	push   %ecx
 80483c5:	56                   	push   %esi
 80483c6:	c7 c0 b6 84 04 08    	mov    $0x80484b6,%eax
 80483cc:	50                   	push   %eax
 80483cd:	e8 9e ff ff ff       	call   8048370 <__libc_start_main@plt>
 80483d2:	f4                   	hlt    
 80483d3:	8b 1c 24             	mov    (%esp),%ebx
 80483d6:	c3                   	ret    
 80483d7:	66 90                	xchg   %ax,%ax
 80483d9:	66 90                	xchg   %ax,%ax
 80483db:	66 90                	xchg   %ax,%ax
 80483dd:	66 90                	xchg   %ax,%ax
 80483df:	90                   	nop

080483e0 <_dl_relocate_static_pie>:
 80483e0:	f3 c3                	repz ret 
 80483e2:	66 90                	xchg   %ax,%ax
 80483e4:	66 90                	xchg   %ax,%ax
 80483e6:	66 90                	xchg   %ax,%ax
 80483e8:	66 90                	xchg   %ax,%ax
 80483ea:	66 90                	xchg   %ax,%ax
 80483ec:	66 90                	xchg   %ax,%ax
 80483ee:	66 90                	xchg   %ax,%ax

080483f0 <__x86.get_pc_thunk.bx>:
 80483f0:	8b 1c 24             	mov    (%esp),%ebx
 80483f3:	c3                   	ret    
 80483f4:	66 90                	xchg   %ax,%ax
 80483f6:	66 90                	xchg   %ax,%ax
 80483f8:	66 90                	xchg   %ax,%ax
 80483fa:	66 90                	xchg   %ax,%ax
 80483fc:	66 90                	xchg   %ax,%ax
 80483fe:	66 90                	xchg   %ax,%ax

08048400 <deregister_tm_clones>:
 8048400:	b8 28 a0 04 08       	mov    $0x804a028,%eax
 8048405:	3d 28 a0 04 08       	cmp    $0x804a028,%eax
 804840a:	74 24                	je     8048430 <deregister_tm_clones+0x30>
 804840c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048411:	85 c0                	test   %eax,%eax
 8048413:	74 1b                	je     8048430 <deregister_tm_clones+0x30>
 8048415:	55                   	push   %ebp
 8048416:	89 e5                	mov    %esp,%ebp
 8048418:	83 ec 14             	sub    $0x14,%esp
 804841b:	68 28 a0 04 08       	push   $0x804a028
 8048420:	ff d0                	call   *%eax
 8048422:	83 c4 10             	add    $0x10,%esp
 8048425:	c9                   	leave  
 8048426:	c3                   	ret    
 8048427:	89 f6                	mov    %esi,%esi
 8048429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048430:	f3 c3                	repz ret 
 8048432:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048440 <register_tm_clones>:
 8048440:	b8 28 a0 04 08       	mov    $0x804a028,%eax
 8048445:	2d 28 a0 04 08       	sub    $0x804a028,%eax
 804844a:	c1 f8 02             	sar    $0x2,%eax
 804844d:	89 c2                	mov    %eax,%edx
 804844f:	c1 ea 1f             	shr    $0x1f,%edx
 8048452:	01 d0                	add    %edx,%eax
 8048454:	d1 f8                	sar    %eax
 8048456:	74 20                	je     8048478 <register_tm_clones+0x38>
 8048458:	ba 00 00 00 00       	mov    $0x0,%edx
 804845d:	85 d2                	test   %edx,%edx
 804845f:	74 17                	je     8048478 <register_tm_clones+0x38>
 8048461:	55                   	push   %ebp
 8048462:	89 e5                	mov    %esp,%ebp
 8048464:	83 ec 10             	sub    $0x10,%esp
 8048467:	50                   	push   %eax
 8048468:	68 28 a0 04 08       	push   $0x804a028
 804846d:	ff d2                	call   *%edx
 804846f:	83 c4 10             	add    $0x10,%esp
 8048472:	c9                   	leave  
 8048473:	c3                   	ret    
 8048474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048478:	f3 c3                	repz ret 
 804847a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048480 <__do_global_dtors_aux>:
 8048480:	80 3d 28 a0 04 08 00 	cmpb   $0x0,0x804a028
 8048487:	75 17                	jne    80484a0 <__do_global_dtors_aux+0x20>
 8048489:	55                   	push   %ebp
 804848a:	89 e5                	mov    %esp,%ebp
 804848c:	83 ec 08             	sub    $0x8,%esp
 804848f:	e8 6c ff ff ff       	call   8048400 <deregister_tm_clones>
 8048494:	c6 05 28 a0 04 08 01 	movb   $0x1,0x804a028
 804849b:	c9                   	leave  
 804849c:	c3                   	ret    
 804849d:	8d 76 00             	lea    0x0(%esi),%esi
 80484a0:	f3 c3                	repz ret 
 80484a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80484a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080484b0 <frame_dummy>:
 80484b0:	55                   	push   %ebp
 80484b1:	89 e5                	mov    %esp,%ebp
 80484b3:	5d                   	pop    %ebp
 80484b4:	eb 8a                	jmp    8048440 <register_tm_clones>

080484b6 <main>:
 80484b6:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80484ba:	83 e4 f0             	and    $0xfffffff0,%esp
 80484bd:	ff 71 fc             	push   -0x4(%ecx)
 80484c0:	55                   	push   %ebp
 80484c1:	89 e5                	mov    %esp,%ebp
 80484c3:	53                   	push   %ebx
 80484c4:	51                   	push   %ecx
 80484c5:	83 ec 70             	sub    $0x70,%esp
 80484c8:	e8 23 ff ff ff       	call   80483f0 <__x86.get_pc_thunk.bx>
 80484cd:	81 c3 33 1b 00 00    	add    $0x1b33,%ebx
 80484d3:	83 ec 0c             	sub    $0xc,%esp
 80484d6:	8d 83 f0 e5 ff ff    	lea    -0x1a10(%ebx),%eax
 80484dc:	50                   	push   %eax
 80484dd:	e8 7e fe ff ff       	call   8048360 <puts@plt>
 80484e2:	83 c4 10             	add    $0x10,%esp
 80484e5:	83 ec 0c             	sub    $0xc,%esp
 80484e8:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80484eb:	50                   	push   %eax
 80484ec:	e8 5f fe ff ff       	call   8048350 <gets@plt>
 80484f1:	83 c4 10             	add    $0x10,%esp
 80484f4:	83 ec 0c             	sub    $0xc,%esp
 80484f7:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80484fa:	50                   	push   %eax
 80484fb:	e8 40 fe ff ff       	call   8048340 <printf@plt>
 8048500:	83 c4 10             	add    $0x10,%esp
 8048503:	83 ec 0c             	sub    $0xc,%esp
 8048506:	6a 0a                	push   $0xa
 8048508:	e8 73 fe ff ff       	call   8048380 <putchar@plt>
 804850d:	83 c4 10             	add    $0x10,%esp
 8048510:	8b 83 2c 00 00 00    	mov    0x2c(%ebx),%eax
 8048516:	83 ec 08             	sub    $0x8,%esp
 8048519:	50                   	push   %eax
 804851a:	8d 83 fc e5 ff ff    	lea    -0x1a04(%ebx),%eax
 8048520:	50                   	push   %eax
 8048521:	e8 1a fe ff ff       	call   8048340 <printf@plt>
 8048526:	83 c4 10             	add    $0x10,%esp
 8048529:	8b 83 2c 00 00 00    	mov    0x2c(%ebx),%eax
 804852f:	83 f8 64             	cmp    $0x64,%eax
 8048532:	75 14                	jne    8048548 <main+0x92>
 8048534:	83 ec 0c             	sub    $0xc,%esp
 8048537:	8d 83 07 e6 ff ff    	lea    -0x19f9(%ebx),%eax
 804853d:	50                   	push   %eax
 804853e:	e8 1d fe ff ff       	call   8048360 <puts@plt>
 8048543:	83 c4 10             	add    $0x10,%esp
 8048546:	eb 12                	jmp    804855a <main+0xa4>
 8048548:	83 ec 0c             	sub    $0xc,%esp
 804854b:	8d 83 22 e6 ff ff    	lea    -0x19de(%ebx),%eax
 8048551:	50                   	push   %eax
 8048552:	e8 09 fe ff ff       	call   8048360 <puts@plt>
 8048557:	83 c4 10             	add    $0x10,%esp
 804855a:	b8 00 00 00 00       	mov    $0x0,%eax
 804855f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048562:	59                   	pop    %ecx
 8048563:	5b                   	pop    %ebx
 8048564:	5d                   	pop    %ebp
 8048565:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048568:	c3                   	ret    
 8048569:	66 90                	xchg   %ax,%ax
 804856b:	66 90                	xchg   %ax,%ax
 804856d:	66 90                	xchg   %ax,%ax
 804856f:	90                   	nop

08048570 <__libc_csu_init>:
 8048570:	55                   	push   %ebp
 8048571:	57                   	push   %edi
 8048572:	56                   	push   %esi
 8048573:	53                   	push   %ebx
 8048574:	e8 77 fe ff ff       	call   80483f0 <__x86.get_pc_thunk.bx>
 8048579:	81 c3 87 1a 00 00    	add    $0x1a87,%ebx
 804857f:	83 ec 0c             	sub    $0xc,%esp
 8048582:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 8048586:	8d b3 10 ff ff ff    	lea    -0xf0(%ebx),%esi
 804858c:	e8 7b fd ff ff       	call   804830c <_init>
 8048591:	8d 83 0c ff ff ff    	lea    -0xf4(%ebx),%eax
 8048597:	29 c6                	sub    %eax,%esi
 8048599:	c1 fe 02             	sar    $0x2,%esi
 804859c:	85 f6                	test   %esi,%esi
 804859e:	74 25                	je     80485c5 <__libc_csu_init+0x55>
 80485a0:	31 ff                	xor    %edi,%edi
 80485a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80485a8:	83 ec 04             	sub    $0x4,%esp
 80485ab:	55                   	push   %ebp
 80485ac:	ff 74 24 2c          	push   0x2c(%esp)
 80485b0:	ff 74 24 2c          	push   0x2c(%esp)
 80485b4:	ff 94 bb 0c ff ff ff 	call   *-0xf4(%ebx,%edi,4)
 80485bb:	83 c7 01             	add    $0x1,%edi
 80485be:	83 c4 10             	add    $0x10,%esp
 80485c1:	39 fe                	cmp    %edi,%esi
 80485c3:	75 e3                	jne    80485a8 <__libc_csu_init+0x38>
 80485c5:	83 c4 0c             	add    $0xc,%esp
 80485c8:	5b                   	pop    %ebx
 80485c9:	5e                   	pop    %esi
 80485ca:	5f                   	pop    %edi
 80485cb:	5d                   	pop    %ebp
 80485cc:	c3                   	ret    
 80485cd:	8d 76 00             	lea    0x0(%esi),%esi

080485d0 <__libc_csu_fini>:
 80485d0:	f3 c3                	repz ret 

Disassembly of section .fini:

080485d4 <_fini>:
 80485d4:	53                   	push   %ebx
 80485d5:	83 ec 08             	sub    $0x8,%esp
 80485d8:	e8 13 fe ff ff       	call   80483f0 <__x86.get_pc_thunk.bx>
 80485dd:	81 c3 23 1a 00 00    	add    $0x1a23,%ebx
 80485e3:	83 c4 08             	add    $0x8,%esp
 80485e6:	5b                   	pop    %ebx
 80485e7:	c3                   	ret    
